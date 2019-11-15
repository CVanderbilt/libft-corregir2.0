/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/04 19:21:19 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/15 15:23:08 by eherrero         ###   ########.fr       */
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
	l2 = 0;
	//if (!(s1 && s2 && (!(l2 = 0) || 1))) //AL REVES!!
	if (!s1 && !s2 && ((l2 = 0) || 1))
	{
		printf("kk");
		return (0);
	}
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


int		main(int argc, char *argv[])
{
	char *ret;

	ret = ft_strjoin("test", 0);
	printf("|%s|\n", ret);
	free(ret);
	return(0);
}
