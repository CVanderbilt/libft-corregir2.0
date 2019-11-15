/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/04 19:31:04 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/15 13:55:51 by eherrero         ###   ########.fr       */
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



int		main(int argc, char *argv[])
{
	char *ret;

	ret = ft_strtrim(argv[1], argv[2]);
	printf("%s", ret);
	free(ret);
	return(0);
}
