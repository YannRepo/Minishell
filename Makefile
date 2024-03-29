##########   BASE   ##########
# File name
NAME = minishell

# Sources
SRCS += main.c
SRCS += src/10_initialisation/data_initialisation.c
SRCS += src/15_minishell_loop/minishell_loop.c
SRCS += src/17_error_management/error_cd.c
SRCS += src/17_error_management/error_close.c
SRCS += src/17_error_management/error_cmd_not_found.c
SRCS += src/17_error_management/error_dup2.c
SRCS += src/17_error_management/error_execve.c
SRCS += src/17_error_management/error_exit.c
SRCS += src/17_error_management/error_fork.c
SRCS += src/17_error_management/error_pipe.c
SRCS += src/17_error_management/error_pwd.c
SRCS += src/17_error_management/print_error_open.c
SRCS += src/17_error_management/print_error.c
SRCS += src/20_lexer/lexer.c
SRCS += src/20_lexer/lexer_utils.c
SRCS += src/20_lexer/lexer_metacharacters.c
SRCS += src/20_lexer/lexer_words.c
SRCS += src/21_parser/parser.c
SRCS += src/21_parser/parser_utils.c
SRCS += src/22_heredoc/heredoc.c
SRCS += src/22_heredoc/heredoc_utils.c
SRCS += src/22_heredoc/heredoc_manipulation.c
SRCS += src/23_gp_tkn_lst/gp_tokens.c
SRCS += src/23_gp_tkn_lst/gp_tokens_utils.c
SRCS += src/24_signals/signals_1.c
SRCS += src/24_signals/signals_2.c
SRCS += src/24_signals/signals_3.c
SRCS += src/25_expand/expand_1.c
SRCS += src/25_expand/expand_2.c
SRCS += src/27_rm_quotes/rm_quotes_in_token.c
SRCS += src/27_rm_quotes/rm_quotes_in_token_list.c
SRCS += src/28_exec_list_creation/count_pipes.c
SRCS += src/28_exec_list_creation/create_exec_elm_list.c
SRCS += src/30_read_gp_token_to_fill_exec_list/read_gp_token_list.c
SRCS += src/30_read_gp_token_to_fill_exec_list/read_redirection_token.c
SRCS += src/30_read_gp_token_to_fill_exec_list/read_token_cmd.c
SRCS += src/30_read_gp_token_to_fill_exec_list/read_token_heredoc.c
SRCS += src/36_command_execution/close_fd.c
SRCS += src/36_command_execution/exec_all_commands.c
SRCS += src/36_command_execution/exec_one_command.c
SRCS += src/36_command_execution/find_command_path.c
SRCS += src/36_command_execution/manage_fd_and_redirections.c
SRCS += src/40_builtin/builtin_cd.c
SRCS += src/40_builtin/builtin_echo.c
SRCS += src/40_builtin/builtin_env.c
SRCS += src/40_builtin/builtin_exit.c
SRCS += src/40_builtin/builtin_export.c
SRCS += src/40_builtin/builtin_pwd.c
SRCS += src/40_builtin/builtin_unset.c
SRCS += src/40_builtin/ft_is_builtin.c
SRCS += src/45_environment/env_initialisation.c
SRCS += src/45_environment/env_manipulation_1.c
SRCS += src/45_environment/env_manipulation_2.c
SRCS += src/50_exit_functions/exit.c
SRCS += src/60_tools/exec_elm_manipulation.c
SRCS += src/60_tools/ft_add_to_str.c
SRCS += src/60_tools/ft_null_terminated_tab_len.c
SRCS += src/60_tools/ft_rm_from_str.c
SRCS += src/60_tools/ft_split_with_garbage_collector.c
SRCS += src/60_tools/ft_strcmp.c
SRCS += src/60_tools/garbage_collector_1.c
SRCS += src/60_tools/garbage_collector_2.c
SRCS += src/60_tools/print_color.c
SRCS += src/60_tools/tkn_manipulation.c

OBJS = ${SRCS:.c=.o}

HEADER += includes/error_message.h
HEADER += includes/minishell.h
HEADER += libft/libft.h

INCLUDES_DIR= -I ./includes/ -I ./libft/

LIB_INCLUDE = -L ./libft -lft

# Compilateurs
CC = cc
#CFLAGS = -g
# CFLAGS = -Wall -Wextra -Werror -g
CFLAGS = -Wall -Wextra -g

##########   RULES   ##########


all: $(NAME)

$(NAME): $(OBJS) $(HEADER)
	make -C ./libft all
	${CC} ${SRCS} -l readline -o ${NAME} ${CFLAGS} ${INCLUDES_DIR} ${LIB_INCLUDE}

%.o: %.c $(HEADER)
	$(CC) -o $@ -c $< $(CFLAGS) $(INCLUDES_DIR)

clean:
	rm -f $(OBJS)
	make -C ./libft clean

fclean: clean
	rm -f $(NAME)
	make -C ./libft fclean

re: fclean all

.PHONY: all clean fclean re
