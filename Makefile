# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: melsahha <melsahha@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 16:28:04 by melsahha          #+#    #+#              #
#    Updated: 2023/05/05 11:33:30 by melsahha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
LIBFT = libft.a
LIBFT_DIR = ./libft_src/
SRC = ft_printf.c ft_putuint.c ft_putnbr.c ft_putchar.c ft_puthex.c ft_putpoint.c
OBJS = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))
CFLAGS = -Wall -Werror -Wextra
CC = cc
INCL = ./include/
OBJ_DIR = obj


$(NAME): $(OBJS) $(OBJ_DIR)
	make -C $(LIBFT_DIR)
	mv $(LIBFT_DIR)$(LIBFT) .
	mv $(LIBFT) $(NAME)
	ar -rcs $(NAME) $(OBJS)

all: $(NAME)

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) -c $(CFLAGS) -I$(INCL) $< -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR) $(LIBFT)
	make -sC $(LIBFT_DIR) clean


fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean re fclean all
