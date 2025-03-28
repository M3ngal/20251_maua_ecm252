import React from 'react'

class App extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      latitude: null,
      longitude: null,
      estacao: null,
      data: null,
      icone: null,
      mensagemDeErro: null
    }
  }

  estacoes = {

  VERAO: {
    icone: "sun",
    nome:  "verao"
  },

  INVERNO: {
    icone: "snowman",
    nome:  "inverno"
  },

  OUTONO: {
    icone: "leaf",
    nome:  "outono"
  },

  PRIMAVERA: {
    icone: "fan",
    nome:  "primavera"
  }
  }

  obterEstacao = (data, latitude) => {
    const anoAtual = data.getFullYear()
    const d1 = new Date(anoAtual, 5, 21)
    const d2 = new Date(anoAtual, 8, 24)
    const d3 = new Date(anoAtual, 11, 22)
    const d4 = new Date(anoAtual, 2, 21)
    const estouNoSul = latitude < 0
    if(data >= d1 && data < d2)
      return estouNoSul ? this.estacoes.INVERNO : this.estacoes.VERAO
    if(data >= d2 && data < d3)
      return estouNoSul ? this.estacoes.PRIMAVERA : this.estacoes.OUTONO
    if(data >= d3 || data < d4)
      return estouNoSul ?   this.estacoes.VERAO : this.estacoes.INVERNO
    return estouNoSul ? this.estacoes.OUTONO : this.estacoes.PRIMAVERA
  }

  obterLocalizacao = () => {
    navigator.geolocation.getCurrentPosition(
      (position) => {
        //1. extrair a data atual do sistema
        const data = new Date()
        //2. obter a estacao climatica do usuario usando sua latitude e data atual
        const estacao = this.obterEstacao(data, position.coords.latitude)
        //3. obter o icone apropriado para aquela estacao
        const icone = estacao.icone
        //4. atualizar o estado, causando, como efeito colateral, a atualização da tela
        //dica: use a função setState para atualizar o estado
        this.setState({
          data: data.toLocaleDateString(),
          estacao: estacao.nome,
          icone: icone,
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        })
      },
      (err) => {
        this.setState({
          mensagemDeErro: 'Tente novamente mais tarde'
        })
      }
    )
  }

  render() {
    return(
      <div className="container mt-2 text-center">
        <div className="row">
          <div className="cols-12">
            <div className="justify-content-center d-flex">
              <i className="fa-hippo fas fa-2x"></i>
            </div>
          </div>
        </div>
        <div className="row justify-content-center">
          <div className="col-sm-12 col-lg-6 col-xxl-4">
            <div className="card">
              <div className="card-body">
                <div 
                  className="d-flex align-items-center border rounded mb-2"
                  style={{height: '6rem'}}>
                    <i className={`fas fa-5x fa-${this.state.icone}`}></i>
                    <p className="w-75 ms-3 text-center fs-1">
                      {this.state.estacao}
                    </p>
                </div>
                <div>
                  <p className="text-center">
                    {
                      this.state.latitude ?
                      `Coordenadas: ${this.state.latitude}, ${this.state.longitude}, Data: ${this.state.data}`
                      :
                      this.state.mensagemDeErro ?
                        `${this.state.mensagemDeErro}`
                        :
                        'Clique no Botão para saber a sua estação'
                    }
                  </p>
                </div>
                <buttom type="buttom" className='btn btn-primary w-100 mt-3'
                onClick={() => this.obterLocalizacao()}>
                  Qual a minha estação
                </buttom>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default App