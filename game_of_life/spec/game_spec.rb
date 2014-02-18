require 'spec_helper'

def cells_match?(given, expected)
  game = Game.new given
  game.tick.should == expected
end

describe Game do
  context 'axis y' do
      it '1 cell' do
        cells_match?([[0]], [[0]])
        cells_match?([[1]], [[0]])
      end

      it '2 cells' do
        cells_match?([[0],[0]],
                     [[0],[0]])

        cells_match?([[0],[1]],
                     [[0],[0]])

        cells_match?([[1],[0]],
                     [[0],[0]])

        cells_match?([[1],[1]],
                     [[0],[0]])
      end

      context '3 cells' do
        it 'all die' do
          cells_match?([[0],[0],[0]],
                       [[0],[0],[0]])

          cells_match?([[1],[0],[0]],
                       [[0],[0],[0]])

          cells_match?([[1],[1],[0]],
                       [[0],[0],[0]])
        end

        it 'still alive' do
          cells_match?([[1],[1],[1]],
                       [[0],[1],[0]])
        end
     end

     context '>= 4 cells' do
        it 'all die' do
          cells_match?([[0],[0],[0],[0]],
                       [[0],[0],[0],[0]])

          cells_match?([[1],[0],[0],[0]],
                       [[0],[0],[0],[0]])

          cells_match?([[1],[1],[0],[0]],
                       [[0],[0],[0],[0]])
        end

        it 'still die' do
          cells_match?([[1],[1],[1],[0]],
                       [[0],[1],[0],[0]])

          cells_match?([[0],[1],[1],[1]],
                       [[0],[0],[1],[0]])

          cells_match?([[1],[1],[1],[1]],
                       [[0],[1],[1],[0]])

          cells_match?([[1],[1],[1],[1],[1]],
                       [[0],[1],[1],[1],[0]])
        end
     end
   end

  context 'x axis' do
    it '2 cells' do
      cells_match? [[0,0]],
                   [[0,0]]

      cells_match? [[0,1]],
                   [[0,0]]

      cells_match? [[1,1]],
                   [[0,0]]
    end

    context '3 cells' do
      it 'all die' do
        cells_match? [[0,0,0]],
                     [[0,0,0]]

        cells_match? [[1,0,0]],
                     [[0,0,0]]

        cells_match? [[1,1,0]],
                     [[0,0,0]]
      end

      it 'still alive' do
          cells_match? [[1,1,1]],
                       [[0,1,0]]
      end
    end

    context '4 cells' do
      it 'all will die' do
        cells_match? [[0, 0, 0, 0]],
                     [[0, 0, 0, 0]]

        cells_match? [[1, 0, 0, 0]],
                     [[0, 0, 0, 0]]

        cells_match? [[1, 1, 0, 0]],
                     [[0, 0, 0, 0]]
      end

      it 'still alive' do
        cells_match? [[1, 1, 1, 0]],
                     [[0, 1, 0, 0]]

        cells_match? [[0, 1, 1, 1]],
                     [[0, 0, 1, 0]]

        cells_match? [[1, 1, 1, 1]],
                     [[0, 1, 1, 0]]
      end
    end
  end

  context 'x & y axises' do
    context '2x2 cells' do
      it 'will die' do
        cells_match? [[0,0],
                      [0,0]],
                     [[0,0],
                      [0,0]]

        cells_match? [[1,0],
                      [0,0]],
                     [[0,0],
                      [0,0]]

        cells_match? [[1,1],
                      [0,0]],
                     [[0,0],
                      [0,0]]

        cells_match? [[1,1],
                      [0,1]],
                     [[1,1],
                      [1,1]]

        cells_match? [[1,1],
                      [1,1]],
                     [[1,1],
                      [1,1]]
      end
    end

    context '2x3 cells' do
      it 'still alive' do
        cells_match? [[0,1,0],
                      [1,0,1]],
                     [[0,1,0],
                      [0,1,0]]

        cells_match? [[1,1,1],
                      [1,0,1]],
                     [[1,0,1],
                      [1,0,1]]
      end
    end
  end
end
