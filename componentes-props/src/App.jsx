import Pedido from "./Pedido"

const App = () => {
  return (
    <div className="container border mt-2">
      <div className="row">
        <div className="col-sm-12 col-lg-6 col-xxl-3">
          <Pedido 
          data="22/02/2024"
          titulo="SSD"
          descricao="Um SSD de 512Gb"
          icone="hdd"/>
        </div>
        <div className="col-sm-12 col-lg-6 col-xxl-3">
          <Pedido 
          data="21/03/2023"
          titulo="Livro"
          descricao="Harry Potter"
          icone="book"/>
        </div>
        <div className="col-sm-12 col-lg-6 col-xxl-3">
          <Pedido 
          data="23/01/2022"
          titulo="Hipopótamo"
          descricao="Sim, um hipo!"
          icone="hippo"/>
        </div>
        <div className="col-sm-12 col-lg-6 col-xxl-3">
          <Pedido 
          data="29/06/2025"
          titulo="Boneco de neve"
          descricao="Um boneco de neve que balança sozinho"
          icone="snowman fa-shake"/>
        </div>
      </div>
    </div>
  )
}


export default App