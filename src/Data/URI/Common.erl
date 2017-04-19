-module(data_uRI_common@foreign).
-export([match1FromImpl/5]).

match1FromImpl(Just,Nothing,{Rx,_},I,S) ->
  case re:run(S, Rx, [
    {offset, I},
    {capture, first, index}
  ]) of
  {match, [{I, Len}]} -> Just(binary:part(S,I,Len));
  _ -> Nothing
end.
