import React, { Component } from 'react'
import { IconField } from 'primereact/iconfield'
import { InputIcon } from 'primereact/inputicon'
import { InputText } from 'primereact/inputtext'
import { Button } from 'primereact/button'

export default class Busca extends Component {

  state = {
    termoDeBusca: ''
  }

  render() {
    return (
      <div className='flex flex-column'>
        <IconField iconPosition='left'>
          <InputIcon className='pi pi-search'/>
          <InputText placeholder={this.props.dica}/>
        </IconField>
        <Button 
        className='mt-1'
        label="Ok" 
        outlined/>
      </div>
    )
  }
}

Busca.defaultProps = {
  dica: "Buscar..."
}