# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eherrero <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/07 13:05:48 by eherrero          #+#    #+#              #
#    Updated: 2019/11/15 13:49:24 by eherrero         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libft.a

EXTRA=libft.a

CC=gcc

CFLAGS=-Wall -Wextra -Werror -O3

RM=rm -f

LDFLAGS=-L.

LDLIBS=-lft

HDDIRS=-I includes/

SRC2=ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c \
	 ft_lstiter_bonus.c ft_lstmap_bonus.c ft_lstnew_bonus.c \
	 ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c

SRC=ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c ft_strndup.c \
		 ft_split.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c \
		 ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c \
		 ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
		 ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c \
		 ft_itoa.c ft_memccpy.c ft_memchr.c ft_memcmp.c \
		 ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
		 ft_atoi.c ft_isalnum.c ft_bzero.c ft_calloc.c

OBJ=$(SRC:.c=.o)

OBJ2=$(SRC2:.c=.o) 

$(NAME):
	$(CC) $(CFLAGS) -c $(SRC) $(HDDIRS)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

$(EXTRA):

all: $(NAME)

bonus: 
	$(CC) $(CFLAGS) -c $(SRC) $(SRC2) $(DHDIRS)
	ar rc $(EXTRA) $(OBJ2) $(OBJ)
	ranlib $(EXTRA)

clean:
	$(RM) $(OBJ) $(OBJ2)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean all bonus
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:34:39 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/12 18:28:09 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_atoi(const char *str)
{
	int ret;
	int sign;

	ret = 0;
	sign = 1;
	while ((*str >= 9 && *str <= 13) || *str == 32)
		str++;
	if (*str == '+' || *str == '-')
		sign = *str++ == '-' ? -1 : 1;
	while (*str >= '0' && *str++ <= '9')
		ret = *(str - 1) - 48 + 10 * ret;
	return (ret * sign);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_bzero.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:29:13 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:42:48 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_bzero(void *s, size_t n)
{
	char *i;

	i = (char*)s;
	while (n > 0)
	{
		*(i++) = 0;
		n--;
	}
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:35:16 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 14:22:37 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static void	ft_kk(void *s, size_t n)
{
	char *i;

	i = (char*)s;
	while (n > 0)
	{
		*(i++) = 0;
		n--;
	}
}

void		*ft_calloc(size_t count, size_t size)
{
	void *p;

	if (!(p = malloc(count * size)))
		return (0);
	ft_kk(p, count * size);
	return (p);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isalnum.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:01 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:32:03 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isalnum(int c)
{
	return ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') ||
			(c >= '0' && c <= '9'));
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isalpha.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:31:33 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:31:36 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isalpha(int c)
{
	return ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'));
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isascii.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:13 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:32:14 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isascii(int c)
{
	return (c >= 0 && c <= 127);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isdigit.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:31:46 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:31:47 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isdigit(int c)
{
	return (c >= '0' && c <= '9');
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isprint.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:21 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:16:21 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isprint(int c)
{
	return (c > 31 && c < 127);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 14:09:35 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:10:24 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_dgts(long int n)
{
	int div;
	int i;

	div = 1;
	i = 0;
	n = n < 0 ? n * -1 : n;
	if (n < 10)
		return (1);
	while (n > 0)
	{
		n /= 10;
		i++;
	}
	return (i);
}

char		*ft_itoa(int n)
{
	int			dgts;
	int			min;
	long int	n2;
	char		*p;

	dgts = n >= 0 ? ft_dgts(n) : ft_dgts(n) + 1;
	if (!(p = malloc(dgts + 1)))
		return (0);
	min = n >= 0 ? 0 : 1;
	p[0] = '-';
	p[dgts] = 0;
	n2 = n;
	n2 *= n >= 0 ? 1 : -1;
	while (--dgts >= min)
	{
		p[dgts] = n2 % 10 + 48;
		n2 /= 10;
	}
	return (p);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstadd_back_bonus.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:56:44 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:56:46 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstadd_back(t_list **alst, t_list *new)
{
	t_list *last;

	if (*alst == 0)
		ft_lstadd_front(alst, new);
	last = ft_lstlast(*alst);
	last->next = new;
	new->next = 0;
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstadd_front_bonus.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:57:00 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:57:01 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstadd_front(t_list **alst, t_list *new)
{
	new->next = *alst;
	*alst = new;
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear_bonus.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:57:11 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:57:12 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstclear(t_list **head, void (*del)(void*))
{
	t_list *next;

	if (head && del)
	{
		while (*head)
		{
			next = (*head)->next ? (*head)->next : 0;
			ft_lstdelone(*head, del);
			*head = next;
		}
		head = 0;
	}
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstdelone_bonus.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:57:22 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:57:22 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstdelone(t_list *lst, void (*del)(void*))
{
	del(((void*)lst->content));
	free(lst);
	lst = NULL;
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstiter_bonus.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:57:34 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:57:35 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstiter(t_list *lst, void (*f)(void *))
{
	t_list *next;

	next = lst != 0 ? lst->next : 0;
	while (lst)
	{
		f(lst->content);
		lst = next;
		next = lst != 0 ? lst->next : 0;
	}
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstlast.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 18:07:45 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:42:24 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstlast(t_list *lst)
{
	if (!lst)
		return (lst);
	while (lst->next)
		lst = lst->next;
	return (lst);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:57:48 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:57:49 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	**new_list;
	t_list	*p;
	void	(*k)(void*);

	k = del;
	new_list = malloc(8);
	p = 0;
	if (!lst)
		return (0);
	*new_list = p;
	while (lst)
	{
		p = ft_lstnew(f(lst->content));
		ft_lstadd_back(new_list, p);
		lst = lst->next;
	}
	p = *new_list;
	free(new_list);
	return (p);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:58:05 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:58:06 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstnew(void const *content)
{
	t_list *p;

	p = malloc(sizeof(t_list));
	if (!p)
		return (0);
	p->content = (void*)content;
	p->next = 0;
	return (p);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstsize_bonus.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:58:17 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 14:58:18 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_lstsize(t_list *lst)
{
	int		i;
	t_list	*next;

	i = -1;
	next = lst ? lst->next : 0;
	while ((++i || 1) && lst)
	{
		lst = next;
		next = lst ? lst->next : 0;
	}
	return (i);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memccpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:29:53 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:29:57 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void		*ft_memccpy(void *dst, const void *src, int c, size_t n)
{
	unsigned char	*s;
	unsigned char	*d;
	unsigned char	l;

	l = (unsigned char)c;
	d = (unsigned char*)dst;
	s = (unsigned char*)src;
	while (n--)
	{
		*d++ = *s;
		if (*(s++) == l)
			return (d);
	}
	return (0);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:30:34 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:30:36 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memchr(const void *s, int c, size_t n)
{
	unsigned char	*cstr;
	unsigned char	l;

	l = (unsigned char)c;
	cstr = (unsigned char*)s;
	while (n--)
		if (*cstr++ == l)
			return (cstr - 1);
	return (0);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcmp.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:30:46 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:11:00 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_memcmp(const void *s1, const void *s2, size_t n)
{
	unsigned int		i;
	int					tmp;
	const unsigned char	*str1;
	const unsigned char	*str2;

	str1 = s1;
	str2 = s2;
	i = 0;
	while (i < n)
	{
		if ((tmp = str1[i] - str2[i]))
			return (tmp);
		i++;
	}
	return (tmp);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:29:30 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:29:44 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memcpy(void *dst, const void *src, size_t n)
{
	unsigned int	i;
	char			*d;
	const char		*s;

	if (!src && !dst)
		return (0);
	i = 0;
	d = dst;
	s = src;
	while (i < n)
	{
		d[i] = s[i];
		i++;
	}
	return (dst);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:30:08 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:11:35 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	size_t				i;
	unsigned char		*d;
	const unsigned char	*s;

	if (!src && !dst)
		return (0);
	d = (unsigned char*)dst;
	s = (unsigned char*)src;
	i = 0;
	if (s < d)
		while (++i <= len)
			d[len - i] = s[len - i];
	else
		while (len-- > 0)
			*(d++) = *(s++);
	return (dst);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memset.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:28:54 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:11:20 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memset(void *b, int c, size_t len)
{
	char			*s;
	unsigned char	l;

	s = (char*)b;
	l = (unsigned char)c;
	while (len > 0)
	{
		*(s++) = l;
		len--;
	}
	return (b);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putchar_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 16:08:45 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:37:46 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putchar_fd(char c, int fd)
{
	write(fd, &c, 1);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putendl_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 16:13:42 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:38:13 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putendl_fd(char *s, int fd)
{
	ft_putstr_fd(s, fd);
	ft_putchar_fd('\n', fd);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 16:16:57 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:39:02 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static void	ft_rec(long int n, int fd)
{
	if (n > 10)
		ft_rec(n / 10, fd);
	n = n % 10 + 48;
	ft_putchar_fd((char)n, fd);
}

void		ft_putnbr_fd(int n, int fd)
{
	long int nbr;

	nbr = (long int)n;
	if (n < 0)
	{
		ft_putchar_fd('-', fd);
		nbr *= -1;
	}
	ft_rec(nbr, fd);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 16:11:12 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:37:58 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putstr_fd(char *s, int fd)
{
	int i;

	i = -1;
	if (s && fd > 0)
		while (s[++i])
			write(fd, s + i, 1);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/13 12:39:26 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 14:03:55 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_count(char const *s, char c)
{
	int		i;
	int		count;
	char	*str;

	i = 0;
	count = 1;
	str = (char*)s;
	while (*str == c)
		str++;
	if (!*str)
		return (0);
	while (str[i])
	{
		if (str[i] == c)
		{
			while (str[i] == c)
				i++;
			if (!str[i])
				break ;
			count++;
		}
		else
			i++;
	}
	return (count);
}

static char	**ft_split_aux(char const *s, char c, int iw[2], char **ret)
{
	int start;
	int control;
	int word_index;

	start = iw[0];
	control = 0;
	word_index = 0;
	while (iw[1])
	{
		if (control && (s[iw[0]] == c || !s[iw[0]]))
		{
			if (!(ret[word_index] = ft_substr(s, start, iw[0] - start)))
				return (0);
			control = (iw[1]-- || 1) && word_index++ ? 0 : 0;
			while (s[iw[0]] == c)
				iw[0]++;
			start = --iw[0] ? iw[0] + 1 : iw[0] + 1;
		}
		else if (s[iw[0] != c])
			control = 1;
		iw[0]++;
	}
	ret[word_index] = 0;
	return (ret);
}

char		**ft_split(char const *s, char c)
{
	char	**ret;
	int		ind_numw[2];

	ind_numw[0] = 0;
	ind_numw[1] = ft_count(s, c);
	if (!s)
		return (0);
	if (!(ret = malloc(sizeof(char*) * (ind_numw[1] + 1))))
		return (0);
	while (s[ind_numw[0]] == c)
		ind_numw[0]++;
	if (s[ind_numw[0]])
		return (ft_split_aux(s, c, ind_numw, ret));
	else
	{
		ret[0] = 0;
		return (ret);
	}
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:54 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:11:55 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

char	*ft_strchr(const char *s, int c)
{
	int		i;
	char	*p;

	i = -1;
	p = (char*)s;
	while (p[++i])
		if (p[i] == c)
			return (p + i);
	if (p[i] == c)
		return (p + i);
	else
		return (0);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:35:52 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 15:01:08 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *str)
{
	int		i;

	i = 0;
	while (str[i])
		i++;
	return (ft_strndup(str, i));
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/04 19:21:19 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/12 17:21:59 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	int		l1;
	int		l2;
	int		i;
	int		j;
	char	*ret;

	l1 = 0;
	if (!(s1 && s2 && (!(l2 = 0) || 1)))
		return (0);
	while (s1[l1] || s2[l2])
	{
		l1 = s1[l1] ? l1 + 1 : l1;
		l2 = s2[l2] ? l2 + 1 : l2;
	}
	ret = malloc(l1 + l2 + 1);
	if (ret == 0)
		return (0);
	i = -1;
	j = -1;
	while (s1[++i])
		ret[i] = s1[i];
	while (s2[++j])
		ret[i + j] = s2[j];
	ret[i + j] = 0;
	return (ret);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:34:12 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:34:15 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dst, const char *src, size_t dstsize)
{
	size_t	i;
	size_t	dsts;
	size_t	srcs;

	i = 0;
	while (dst[i] && i < dstsize)
		i++;
	dsts = i;
	i = 0;
	while (src[i])
		i++;
	srcs = i;
	if (dstsize == 0 || dstsize - 1 < dsts)
		return (dstsize + srcs);
	i = 0;
	while (src[i] && i + dsts < dstsize - 1)
	{
		dst[i + dsts] = src[i];
		i++;
	}
	dst[i + dsts] = 0;
	return (dsts + srcs);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:34:00 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:34:03 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcpy(char *dst, const char *src, size_t dstsize)
{
	char	*max;
	int		aux;
	char	*ret_s;

	if (!(dst || src))
		return (0);
	max = dst + dstsize;
	ret_s = (char*)src;
	aux = 0;
	while (src[aux] && (dst + aux) < max)
	{
		*(dst + aux) = *(src + aux);
		aux++;
	}
	if ((dst + aux) < max)
		*(dst + aux) = 0;
	else if (dstsize > 0)
		*(dst + aux - 1) = 0;
	aux = 0;
	while (src[aux])
		aux++;
	return (aux);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:31:17 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:31:21 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlen(const char *s)
{
	size_t i;

	i = 0;
	while (s[i])
		i++;
	return (i);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strmapi.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 16:03:57 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 13:14:42 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strmapi(char *s, char (*f)(unsigned int, char))
{
	unsigned int		i;
	char				*str;

	i = 0;
	if (!(s && f))
		return (0);
	while (s[i])
		i++;
	if (!(str = malloc(i + 1)))
		return (0);
	i = 0;
	while (s[i])
	{
		str[i] = f(i, s[i]);
		i++;
	}
	str[i] = 0;
	return (str);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strncmp.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:33:25 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/12 16:15:13 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_strncmp(const char *s1, const char *s2, size_t n)
{
	size_t i;

	if ((!s1 && !s2) || n == 0)
		return (0);
	i = 0;
	while (i < n - 1 && s1[i] == s2[i] && s1[i] && s2[i])
		i++;
	return ((unsigned char)s1[i] - (unsigned char)s2[i]);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strndup.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 14:06:50 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/12 15:55:05 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strndup(const char *str, size_t n)
{
	size_t	i;
	char	*p;

	i = 0;
	while (str[i] && i < n)
		i++;
	p = (char*)malloc(i + 1);
	if (p == 0)
		return (p);
	i = -1;
	while (str[++i] && i < n)
		p[i] = str[i];
	p[i] = 0;
	return (p);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:34:29 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 18:12:24 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static void	ft_init(size_t *a, size_t *b, char **h, char *ret)
{
	*a = 0;
	*b = 0;
	*h = ret;
}

char		*ft_strnstr(const char *haystack, const char *needle, size_t len)
{
	char	*ret;
	char	*h;
	char	*n;
	size_t	aux;
	size_t	aux2;

	ret = (char*)haystack;
	n = (char*)needle;
	ft_init(&aux, &aux2, &h, ret);
	while (h[aux] && n[aux2] && aux < len)
	{
		ret = h[aux] != n[aux2] ? 0 : ret;
		aux2 = h[aux] != n[aux2] ? 0 : aux2;
		if (h[aux] == n[aux2])
		{
			ret = ret != 0 ? ret : h + aux;
			if (n[++aux2] == 0)
				return (ret);
		}
		aux++;
	}
	return (needle[aux2] == 0 ? ret : 0);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:33:11 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:33:13 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	int		i;
	char	*ret;

	i = -1;
	ret = 0;
	while (s[++i])
		if (s[i] == c)
			ret = (char*)(s + i);
	if (s[i] == c)
		ret = (char*)(s + i);
	return (ret);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/04 19:31:04 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 14:03:50 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_contains(char const *str, char c)
{
	while (*str)
	{
		if (*str == c)
			return (1);
		str++;
	}
	return (0);
}

static int	ft_aux(int *i, int *start, int *control)
{
	*i = 0;
	*start = 0;
	*control = 1;
	return (0);
}

char		*ft_strtrim(char const *s1, char const *set)
{
	int		i;
	int		start;
	int		control;

	if ((!s1 || !set))
		return (0);
	ft_aux(&i, &start, &control);
	while (s1[i])
	{
		if (control && ft_contains(set, s1[i]))
			start++;
		else
			control = 0;
		i++;
	}
	if (control == 1)
		return (ft_substr(s1, 0, 0));
	i--;
	while (ft_contains(set, s1[i]))
		i--;
	return (ft_substr(s1, start, i - start + 1));
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/04 19:11:45 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 13:33:13 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char		*ft_substr(char const *s, unsigned int start, size_t len)
{
	if (!s)
		return (0);
	return (start > ft_strlen(s) ? ft_strdup("") : ft_strndup(s + start, len));
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tolower.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:43 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:32:44 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_tolower(int c)
{
	return (c >= 'A' && c <= 'Z' ? c += 32 : c);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_toupper.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 12:32:33 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/11 12:32:35 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_toupper(int c)
{
	return (c >= 'a' && c <= 'z' ? c -= 32 : c);
}
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/05 17:44:33 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/13 14:24:13 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H
# include <stdlib.h>
# include <unistd.h>

typedef	struct	s_list
{
	void			*content;
	struct s_list	*next;
}				t_list;

char			**ft_split(char const *s, char c);
char			*ft_itoa(int n);
char			*ft_strchr(const char *s, int c);
char			*ft_strrchr(const char *s, int c);
char			*ft_strdup(const char *str);
char			*ft_strndup(const char *str, size_t n);
char			*ft_strjoin(char const *s1, char const *s2);
char			*ft_strnstr(const char *hay, const char *needle, size_t len);
char			*ft_strtrim(char const *s1, char const *set);
char			*ft_substr(char const *s, unsigned int start, size_t len);
char			*ft_strmapi(char *s, char (*f)(unsigned int, char));
int				ft_atoi(const char *str);
int				ft_isalnum(int c);
int				ft_isalpha(int c);
int				ft_isascii(int c);
int				ft_isdigit(int c);
int				ft_isprint(int c);
int				ft_memcmp(const void *s1, const void *s2, size_t n);
int				ft_strcmp(const char *s1, const char *s2, size_t n);
int				ft_strncmp(const char *s1, const char *s2, size_t n);
int				ft_tolower(int c);
int				ft_toupper(int c);
size_t			ft_strlcat(char *dst, const char *src, size_t dstsize);
size_t			ft_strlcpy(char *dst, const char *src, size_t dstsize);
size_t			ft_strlen(const char *s);
void			*ft_calloc(size_t count, size_t size);
void			*ft_memccpy(void *dest, const void *src, int c, size_t n);
void			*ft_memchr(const void *str, int c, size_t n);
void			*ft_memcpy(void *dest, const void *src, size_t n);
void			*ft_memmove(void *dest, const void *src, size_t n);
void			*ft_memset(void *str, int c, size_t n);
void			ft_bzero(void *s, size_t n);
void			ft_putchar_fd(char c, int fd);
void			ft_putendl_fd(char *s, int fd);
void			ft_putnbr_fd(int n, int fd);
void			ft_putstr_fd(char *s, int fd);

void			ft_lstadd_back(t_list **alst, t_list *new);
void			ft_lstadd_front(t_list **alst, t_list *new);
void			ft_lstclear(t_list **head, void(*del)(void*));
void			ft_lstdelone(t_list *lst, void (*del)(void*));
void			ft_lstiter(t_list *lst, void (*f)(void *));
t_list			*ft_lstlast(t_list *lst);
t_list			*ft_lstmap(t_list *lst, void *(*f)(void *), void (*d)(void *));
t_list			*ft_lstnew(void const *content);
t_list			*ft_lstprev(t_list *lst, t_list **head);
int				ft_lstsize(t_list *lst);

#endif
