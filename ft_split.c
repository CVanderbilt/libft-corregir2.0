/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/13 12:39:26 by eherrero          #+#    #+#             */
/*   Updated: 2019/11/15 13:52:46 by eherrero         ###   ########.fr       */
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


int		main(int argc, char *argv[])
{
	char **reet;
	int		i;

	i = -1;
	reet = ft_split(argv[1], ' ');
	while (reet[++i])
		printf("%s\n", reet[i]);
	free(reet);
	
	return(0);
}
