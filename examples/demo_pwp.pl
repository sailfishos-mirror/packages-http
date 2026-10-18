:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_pwp)).

:- dynamic user:file_search_path/2.
:- multifile user:file_search_path/2.

pwp_here.
user:file_search_path(http_demo, Dir) :-
    source_file(pwp_here, File),
    file_directory_name(File, Dir).
user:file_search_path(pwp_demo, http_demo(pwp)).

:- http_handler(root(.),
                pwp_handler([path_alias(pwp_demo), view(true)]),
                [prefix]).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).


