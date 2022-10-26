/**
 * @author EvanLyu732
 * @brief This file provided macro using customized spdlog sinker.
 */

#pragma once

#define SPDLOG_ACTIVE_LEVEL SPDLOG_LEVEL_TRACE

#include <spdlog/async.h>
#include <spdlog/common.h>
#include <spdlog/details/log_msg.h>
#include <spdlog/formatter.h>
#include <spdlog/pattern_formatter.h>
#include <spdlog/sinks/ansicolor_sink.h>
#include <spdlog/sinks/base_sink.h>
#include <spdlog/sinks/rotating_file_sink.h>
#include <spdlog/spdlog.h>

#include <array>
#include <boost/asio.hpp>
#include <boost/asio/buffer.hpp>
#include <boost/asio/io_service.hpp>
#include <boost/asio/ip/udp.hpp>
#include <boost/system/error_code.hpp>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <exception>
#include <iostream>
#include <memory>
#include <mutex>
#include <ostream>
#include <string>
#include <string_view>
#include <thread>
#include <utility>

#if __cplusplus >= 201703L
#include <filesystem>
#else
#error "cxx version is not supported std 17!!! Please use higher version cxx compiler"
#endif

#include "cpptoml.h"

//[deprecated]
//#define LOG_MODULE "@LOG_MODULE@"
//#define LOG_FILES_DIRS "logs/@LOG_MODULE@.log"
//#define LOGGER_NAME "@LOG_MODULE@/_logger"

namespace ud::tools::log {
    inline static bool is_init{false};

    struct Color {
        // YELLO FOR WARNING LEVEL
        static inline constexpr std::string_view yellow = "\x1B[38;5;226m";

        // RED FOR ERROR LEVEL
        static inline constexpr std::string_view red = "\x1B[38;5;196m";

        // GREEN FOR INFO LEVEL
        static inline constexpr std::string_view green = "\x1B[38;5;118m";

        // WHITE FOR DEBUG LEVEL
        static inline constexpr std::string_view white = "\x1B[38;5;231m";

        // RESET
        static inline constexpr std::string_view reset = "\033[0m";
    };


    struct Attributes {
        // spdlog pattern
        static inline constexpr char* pattern = "%^|%Y/%D/%H:%M:%S|:|%l|:|%s:%#| %v %$";

        // thread pool nums
        static int inline thread_pool_nums = 2;

        // thread pool size, 8192 by default
        static int inline thread_pool_size = 8192;

        // logger backtrace nums
        static int inline backtrace_nums = 32;
    };

    struct Config {
        // toml file network sinker bind port
        static inline int bind_port;

        // toml file network sinker send port
        static inline int send_port;

        // toml file network sinker log module name
        static inline std::string log_module;

        // toml file network sinker log module name
        static inline std::string log_files_dirs;

        // toml file network sinker logger name
        static inline std::string logger_name;
    };


    template<typename Mutex>
    struct networksink : public spdlog::sinks::base_sink<Mutex> {
        networksink(int bind_port, int send_port = 6999) : send_ep_(::boost::asio::ip::udp::endpoint(::boost::asio::ip::udp::v4(), send_port)),
                                                           service_(::boost::asio::io_service()),
                                                           socket_(::boost::asio::ip::udp::socket(service_, ::boost::asio::ip::udp::endpoint(::boost::asio::ip::udp::v4(), bind_port))) {
            std::lock_guard<std::mutex> lock(Mutex);
            this->formatter_ = std::make_unique<spdlog::pattern_formatter>(Attributes::pattern);
            initialColorLevel();
            service_.run();
        }

        ~networksink() {
            socket_.close();
        }

        void initialColorLevel() {
            colors_[spdlog::level::info] = Color::green;
            colors_[spdlog::level::warn] = Color::yellow;
            colors_[spdlog::level::err] = Color::red;
            colors_[spdlog::level::debug] = Color::white;
            colors_[spdlog::level::off] = Color::reset;
        }

    protected:
        void sink_it_(const ::spdlog::details::log_msg& msg) override {
            ::spdlog::memory_buf_t formatted;

            msg.color_range_start = 0;
            msg.color_range_end = 0;

            this->formatter_->format(msg, formatted);

            auto sink_color = colors_[static_cast<size_t>(msg.level)];

            if (msg.color_range_end > msg.color_range_start) {
                print_range_(formatted, 0, msg.color_range_start);
                print_ccode_(sink_color);
                print_range_(formatted, msg.color_range_start, msg.color_range_end);
                print_ccode_(Color::reset.data());
                print_range_(formatted, msg.color_range_end, formatted.size());
            } else// no color
            {
                print_range_(formatted, 0, formatted.size());
            }

            socket_.async_send_to(::boost::asio::buffer(sink_color.data(), sink_color.size()),
                                  send_ep_,
                                  [this](::boost::system::error_code ec, std::size_t length) {
                                      if (ec) {
                                          return;
                                      }
                                  });

            socket_.async_send_to(::boost::asio::buffer(formatted.data(), formatted.size()),
                                  send_ep_,
                                  [this](::boost::system::error_code ec, std::size_t length) {
                                      if (ec) {
                                          return;
                                      }
                                  });
        }


        void flush_() override {
        }

    private:
        void print_range_(const ::spdlog::memory_buf_t& formatted, size_t start, size_t end) {
            fwrite(formatted.data() + start, sizeof(char), (end - start), stdout);
        }

        void print_ccode_(const std::string& color_code) {
            fwrite(color_code.data(), sizeof(char), color_code.size(), stdout);
        }

    private:
        std::array<std::string, spdlog::level::n_levels> colors_;

        ::boost::asio::io_service service_;
        ::boost::asio::ip::udp::socket socket_;
        ::boost::asio::ip::udp::endpoint send_ep_;
    };


    void setup_config() {
        auto current_path = std::filesystem::current_path().parent_path();
        auto config_path = current_path.string() + "/.spdlog.toml";
        auto config = ::cpptoml::parse_file(config_path);
        Config::bind_port = config->get_qualified_as<int>("spdlog.BIND_PORT").value_or(6688);
        Config::send_port = config->get_qualified_as<int>("spdlog.SEND_PORT").value_or(7799);
        Config::log_module = config->get_qualified_as<std::string>("spdlog.LOG_MODULE").value_or("undefined");
        Config::log_files_dirs = std::string(current_path.string() + "/logs/" + std::string(Config::log_module) + ".log");
        Config::logger_name = std::string(std::string(Config::log_module) + "/_logger");
    }

    void initial_logger() noexcept {
        if (!is_init) {
            setup_config();
            spdlog::init_thread_pool(Attributes::thread_pool_size, Attributes::thread_pool_nums);
            using networksink_mt = networksink<std::mutex>;
            auto network_sinks = std::make_shared<networksink_mt>(Config::bind_port, Config::send_port);
            auto rotating_sink = std::make_shared<spdlog::sinks::rotating_file_sink_mt>(std::string(Config::log_files_dirs), 1024 * 1024 * 10, 3);
            std::vector<spdlog::sink_ptr> sinks{network_sinks, rotating_sink};
            auto logger = std::make_shared<spdlog::async_logger>(std::string(Config::logger_name), sinks.begin(), sinks.end(), spdlog::thread_pool(), spdlog::async_overflow_policy::block);
            spdlog::register_logger(logger);
            is_init = true;
        }
    }

}// namespace ud::tools::log

/**
 * @brief LOG_INFO: logging message in info level
 */
#define LOG_INFO(...)                                                            \
    if (!ud::tools::log::is_init) {                                              \
        ud::tools::log::initial_logger();                                        \
    }                                                                            \
    auto logger = spdlog::get(std::string(ud::tools::log::Config::logger_name)); \
    SPDLOG_LOGGER_INFO(logger, __VA_ARGS__);

/**
 * @brief LOG_WARN: logging message in warn level
 */
#define LOG_WARN(...)                                                            \
    if (!ud::tools::log::is_init) {                                              \
        ud::tools::log::initial_logger();                                        \
    }                                                                            \
    auto logger = spdlog::get(std::string(ud::tools::log::Config::logger_name)); \
    SPDLOG_LOGGER_WARN(logger, __VA_ARGS__);

/**
 * @brief LOG_ERR: logging message in error level
 */
#define LOG_ERR(...)                                                             \
    if (!ud::tools::log::is_init) {                                              \
        ud::tools::log::initial_logger();                                        \
    }                                                                            \
    auto logger = spdlog::get(std::string(ud::tools::log::Config::logger_name)); \
    SPDLOG_LOGGER_ERROR(logger, __VA_ARGS__);
