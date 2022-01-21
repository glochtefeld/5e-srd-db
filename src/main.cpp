#include "../external/argparse/include/argparse/argparse.hpp"
#include "../external/sqlite/sqlite3.h"
#include <cstdlib>
#include <filesystem>
#include <iostream>
#include <string>

namespace fs = std::filesystem;
static argparse::ArgumentParser parser("SRD5 DB");

inline auto print(const std::string& s, const char end='\n') -> void {
    if (parser["--verbose"] == true || parser["--quiet"] == false)
        std::cout << s << end;
}

auto main(int argc, char** argv) -> int {
    argparse::ArgumentParser parser("SRD5 DB");
    parser.add_argument("-o","--output")
        .default_value(std::string("OUT/"))
        .help("specify output database path");
    parser.add_argument("-q", "--quiet")
        .help("suppress all output and accept default settings")
        .default_value(false)
        .implicit_value(true);
    parser.add_argument("-v", "--verbose")
        .help("display debug output")
        .default_value(false)
        .implicit_value(true);

    try {
        parser.parse_args(argc, argv);
    }
    catch (const std::runtime_error& err) {
        std::cerr << err.what() <<std::endl;
        std::cerr << parser;
        std::exit(EXIT_FAILURE);
    }
    auto out = parser.get<std::string>("--output");
    return EXIT_SUCCESS;
}
