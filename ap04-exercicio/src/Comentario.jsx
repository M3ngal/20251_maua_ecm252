const Comentario = (props) => {
    return (
        <div className="d-flex">
            <div className="d-flex">
                <img 
                src={props.image}
                style={{ width: '150px', height: '150px', objectFit: 'cover'}}
                />
            </div>
            <div className="ms-2 p-0 position-relative"> 
                <h4 className="border-bottom">{props.titulo}</h4>
                <p className="text-right">{props.descricao}</p>
                <p style={{fontSize: '0.8rem'}} className="text-right text-muted">{props.data}</p>
            </div>
        </div>
    );
};

export default Comentario;