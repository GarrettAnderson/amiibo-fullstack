import React, { Component } from 'react'
import axios from 'axios'
// import Amiibo from './components/amiiboApp'

class App extends Component {
  constructor() {
    super()
    this.state = {
      amiiboLink: '',
      amiiboText: 'Enter Character',
      searchText: '',
      apiLink: '',
      character: {},
      image: []
    }

    this.handleChange = this.handleChange.bind(this)
    this.characterRequest = this.characterRequest.bind(this)
  }

  handleChange = (e) => {
    const inputValue = e.target.value
    this.setState({ searchText: inputValue }, () => {
      this.characterRequest()
    })
  }

  characterRequest() {
    // fetch('http://localhost:3000/amiibo_characters/' + this.state.searchText)
    //   .then((res) => res.json())
    //   .then((result) => {
    //     console.log(result.amiibo)
    //     this.setState({
    //       character: result.amiibo,
    //       image: result.amiibo.image
    //     })
    //   })
    console.log('searching for')
    console.log(this.state.searchText)
    axios.get(`http://localhost:3000/amiibo_characters?name=${this.state.searchText}`).then((response) => {
      console.log(response.data)
      this.setState({
        character: response.data[0].name,
        image: response.data[0].image_URL
      })
    })
  }
  // make an ajax call
  // interpolate link state and search word
  // set state if successful

  render() {
    return (
      <div className="content-container">
        <section className="search-container">
          <header>
            <h2>Search a Nintendo character by name to see it's amiibo card!</h2>
            <h4>(Mario, Princess Peach, Luigi)</h4>
          </header>
          <input onChange={this.handleChange} id="lookUp" type="text" name="" value={this.state.searchText} />
          <button onClick={this.characterRequest} type="button" name="button">
            Look Up
          </button>
          <img src={this.state.image} alt="" />
        </section>
        {/* <footer>Built by Garrett L.G. Anderson</footer> */}
      </div>
    )
  }
}

export default App
