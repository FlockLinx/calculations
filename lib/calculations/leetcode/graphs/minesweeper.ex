defmodule Calculation.Leetcode.Graph.Minesweeper do
  # board = [["B","1","E","1","B"],["B","1","M","1","B"],["B","1","1","1","B"],["B","B","B","B","B"]]
  # click = [3,0]
  # click importa, é o ponto de partida onde o dfs comeca se for em cima da mina troca o valor para X
  # se nao for itera ate encontrar
  # need to draw graph
  # need to find and identify the neighbors
  # can I use BFS? - because of the neighbors. - not really we need to iterate all over the nodes
  # the unrevelead mine is provide, if I discover the path and then return?
  # maybe with DFS can be better? yes
  # [[[0,0], [0,1], [0,2], [0,3], [0,4]] <- primeira linha do board

  @directions [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]

  # preciso desenhar o graph -> isso seria a fase final
  # nao seria o graph eh o proprio board, eu atualizo e retorno, assim fica mais facil
  def revelead_board(board, click) do
    [row, col] = click
    # precisaria percorrer toda a matriz
    # faco isso com 2 for i e j ou tem uma maneira melhor que essa?
    # a primeira coisa que vem na minha cabeca seria 2 for
    # mas eu poderia muito bem fazer isso com uma recursao até o fim da matris [h | t]
    # onde h seria a linha para ser verificada quando acabar a lista percorri toda a matriz

    # board size {rows , colums}
    {rows, cols} = {length(board), length(hd(board))}

    case get(board, row, col) do
      # se o click for em M ja seta para X
      # se nao for usa dfs para iterar
      "M" ->
        set(board, row, col, "X")

      "E" ->
        dfs(board, row, col, rows, cols)

      _ ->
        board

        # nesse caso quando nao se consegue mais iterar retorna o board (grafo) atualizado (revealed)
    end
  end

  # Pega exatamente a posicao quando passo a coordenada
  def get(board, row, col) do
    board |> Enum.at(row) |> Enum.at(col)
  end

  # aqui que dada as coordenadas atualiza o valor fornecido
  # irei usar esse metodo varias vezes
  def set(board, row, col, value) do
    List.update_at(board, row, fn line ->
      List.update_at(line, col, fn _ -> value end)
    end)
  end

  def counter_adjacents_mines(board, row, col, rows, cols) do
    # pega os vizinhos e conta quantos M se tem 
    neighbors({row, col}, rows, cols)
    |> Enum.count(fn {r, c} -> get(board, r, c) == "M" end)
  end

  def neighbors({row, col}, rows, cols) do
    for {dr, dc} <- @directions,
        r = row + dr,
        c = col + dc,
        r >= 0 and r < rows and c >= 0 and c < cols do
      {r, c}
    end
  end

  def dfs(board, row, col, rows, cols) do
    mine = counter_adjacents_mines(board, row, col, rows, cols)

    if mine > 0 do
      set(board, row, col, Integer.to_string(mine))
    else
      # visited
      board = set(board, row, col, "B")

      # nesse caso o board vai ser o acc e ele sera atualizado
      Enum.reduce(neighbors({row, col}, rows, cols), board, fn {r, c}, acc ->
        # se for do tipo E continua a busca
        # se nao for retorna o board (acc atualizado) 
        if get(acc, r, c) == "E" do
          dfs(acc, r, c, rows, cols)
        else
          acc
        end
      end)
    end
  end
end
