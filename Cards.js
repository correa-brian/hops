import React from 'react'
import {View} from 'react-native'

const Cards = ({children}) => {

  const { contentContainerStyle} = style
  return (
    <View style ={contentContainerStyle}>
    {children}
    </View>
  )
}

const style = {
  contentContainerStyle: {
    borderWidth: 1,
    borderRadius: 2,
    borderColor: '#ddd',
    borderBottomWidth: 0,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 1,
    marginLeft: 5,
    marginRight: 5,
    marginTop: 10
  }
}

export {Cards}
